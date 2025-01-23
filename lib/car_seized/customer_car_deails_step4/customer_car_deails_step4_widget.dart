import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'customer_car_deails_step4_model.dart';
export 'customer_car_deails_step4_model.dart';

class CustomerCarDeailsStep4Widget extends StatefulWidget {
  const CustomerCarDeailsStep4Widget({
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

  @override
  State<CustomerCarDeailsStep4Widget> createState() =>
      _CustomerCarDeailsStep4WidgetState();
}

class _CustomerCarDeailsStep4WidgetState
    extends State<CustomerCarDeailsStep4Widget> {
  late CustomerCarDeailsStep4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerCarDeailsStep4Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CustomerCarDeailsStep4'});
    _model.priceTextFieldTextController ??= TextEditingController();
    _model.priceTextFieldFocusNode ??= FocusNode();
    _model.priceTextFieldFocusNode!.addListener(
      () async {
        if ((_model.priceTextFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.priceTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.priceTextFieldTextController.text);
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
            'อัพโหลดรูปเข้าประมูล',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(),
                  color: Color(0xFF003063),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 0.0, 0.0),
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
                                                  font: GoogleFonts.poppins(),
                                                  color: Color(0xFF404040),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
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
                                                  font: GoogleFonts.poppins(),
                                                  color: Color(0xFF404040),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
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
                                            widget!.impoundCarParamSet
                                                ?.improundCONTNOTYPENAME,
                                            'type_name',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(),
                                                color: Color(0xFF404040),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 5.0, 0.0, 0.0),
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
                                                  font: GoogleFonts.poppins(),
                                                  color: Color(0xFF404040),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
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
                                                  font: GoogleFonts.poppins(),
                                                  color: Color(0xFF404040),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
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
                                            widget!.impoundCarParamSet
                                                ?.improundREGNO,
                                            'default',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(),
                                                color: Color(0xFF404040),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 5.0, 0.0, 0.0),
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
                                            'อัพโหลดรูปเข้าประมูล',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(),
                                                  color: Color(0xFF404040),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'บังคับอัพโหลดอย่างน้อย 1 รูป',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFFFF0000),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '1.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              'หน้าตรง (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.74,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading1 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading1 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile1 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile1 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile1
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile1 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile1
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.uploadedLocalFile1 !=
                                                      null &&
                                                  (_model.uploadedLocalFile1
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile1 != null &&
                                      (_model.uploadedLocalFile1.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile1
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag1',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag1',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile1
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading1 =
                                                              false;
                                                          _model.uploadedLocalFile1 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '2.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              'หน้าซ้าย 45 องศา (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                          flex: 10,
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading2 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading2 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile2 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile2 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile2
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile2 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile2
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.uploadedLocalFile2 !=
                                                      null &&
                                                  (_model.uploadedLocalFile2
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile2 != null &&
                                      (_model.uploadedLocalFile2.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile2
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag2',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag2',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile2
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading2 =
                                                              false;
                                                          _model.uploadedLocalFile2 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '3.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                          ),
                                          Text(
                                            'หลังซ้าย 45 องศา (ถ้ามี)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(),
                                                  color: Color(0xFF404040),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading3 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading3 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile3 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile3 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile3
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile3 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile3
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile3 !=
                                                      null &&
                                                  (_model.uploadedLocalFile3
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile3 != null &&
                                      (_model.uploadedLocalFile3.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile3
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag3',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag3',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile3
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading3 =
                                                              false;
                                                          _model.uploadedLocalFile3 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '4.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              'หลังตรง (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading4 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading4 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile4 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile4 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile4
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile4 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile4
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile4 !=
                                                      null &&
                                                  (_model.uploadedLocalFile4
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile4 != null &&
                                      (_model.uploadedLocalFile4.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile4
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag4',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag4',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile4
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading4 =
                                                              false;
                                                          _model.uploadedLocalFile4 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '5.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              'หลังขวา 45 องศา (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading5 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading5 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile5 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile5 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile5
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile5 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile5
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile5 !=
                                                      null &&
                                                  (_model.uploadedLocalFile5
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile5 != null &&
                                      (_model.uploadedLocalFile5.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile5
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag5',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag5',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile5
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading5 =
                                                              false;
                                                          _model.uploadedLocalFile5 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '6.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              'หน้าขวา 45 องศา (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading6 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading6 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile6 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile6 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile6
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile6 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile6
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile6 !=
                                                      null &&
                                                  (_model.uploadedLocalFile6
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile6 != null &&
                                      (_model.uploadedLocalFile6.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile6
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag6',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag6',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile6
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading6 =
                                                              false;
                                                          _model.uploadedLocalFile6 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '7.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              widget!.carConfig!.contains(
                                                      widget!.impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'เลขไมล์ (ถ้ามี)'
                                                  : 'เลขตัวถังรถ (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading7 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading7 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile7 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile7 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile7
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile7 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile7
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile7 !=
                                                      null &&
                                                  (_model.uploadedLocalFile7
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile7 != null &&
                                      (_model.uploadedLocalFile7.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile7
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag7',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag7',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile7
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading7 =
                                                              false;
                                                          _model.uploadedLocalFile7 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
                                      queryParameters: {
                                        'imageName': serializeParam(
                                          widget!.impoundCarParamSet
                                                      ?.improundCONTNOTYPE ==
                                                  'C'
                                              ? 'คอลโซลหน้า'
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
                                              '8.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              widget!.carConfig!.contains(
                                                      widget!.impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'คอลโซลหน้า (ถ้ามี)'
                                                  : 'รูปเครื่องยนต์ (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading8 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading8 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile8 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile8 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile8
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile8 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile8
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile8 !=
                                                      null &&
                                                  (_model.uploadedLocalFile8
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile8 != null &&
                                      (_model.uploadedLocalFile8.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile8
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag8',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag8',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile8
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading8 =
                                                              false;
                                                          _model.uploadedLocalFile8 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SampleCarImageStep1',
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
                                              '9.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              widget!.carConfig!.contains(
                                                      widget!.impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'เบาะหลัง (ถ้ามี)'
                                                  : 'เลขไมล์ (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading9 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading9 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile9 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile9 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile9
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile9 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile9
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile9 !=
                                                      null &&
                                                  (_model.uploadedLocalFile9
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile9 != null &&
                                      (_model.uploadedLocalFile9.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile9
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag9',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag9',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile9
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading9 =
                                                              false;
                                                          _model.uploadedLocalFile9 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (widget!.carConfig!.contains(widget!
                                        .impoundCarParamSet
                                        ?.improundCONTNOTYPE)) {
                                      context.pushNamed(
                                        'SampleCarImageStep1',
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
                                    }
                                  },
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
                                              '10.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              widget!.carConfig!.contains(
                                                      widget!.impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'รูปเครื่องยนต์ (ถ้ามี)'
                                                  : 'อื่นๆ (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading10 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading10 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile10 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile10 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile10
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile10 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile10
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile10 !=
                                                      null &&
                                                  (_model.uploadedLocalFile10
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile10 != null &&
                                      (_model.uploadedLocalFile10.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile10
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag10',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag10',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile10
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading10 =
                                                              false;
                                                          _model.uploadedLocalFile10 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (widget!.carConfig!.contains(widget!
                                        .impoundCarParamSet
                                        ?.improundCONTNOTYPE)) {
                                      context.pushNamed(
                                        'SampleCarImageStep1',
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
                                    }
                                  },
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
                                              '11.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Text(
                                              widget!.carConfig!.contains(
                                                      widget!.impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'เลขตัวถังรถ (ถ้ามี)'
                                                  : 'อื่นๆ (ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(),
                                                    color: Color(0xFF404040),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.image,
                                              color: Color(0xFF404040),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading11 =
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
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading11 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile11 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedLocalFile11 !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile11
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFFE6400),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedLocalFile11 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile11
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? 'อัพโหลดสำเร็จ'
                                                        : 'ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(),
                                                          letterSpacing: 0.0,
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
                                              if (_model.uploadedLocalFile11 !=
                                                      null &&
                                                  (_model.uploadedLocalFile11
                                                          .bytes?.isNotEmpty ??
                                                      false)) {
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            color: Color(
                                                                0xFF24BF03),
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
                                                      AlignmentDirectional(
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
                                  if (_model.uploadedLocalFile11 != null &&
                                      (_model.uploadedLocalFile11.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                            _model.uploadedLocalFile11
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag11',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag11',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile11
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.black,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: Colors.white,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading11 =
                                                              false;
                                                          _model.uploadedLocalFile11 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget!.carConfig!.contains(widget!
                                            .impoundCarParamSet
                                            ?.improundCONTNOTYPE)) {
                                          context.pushNamed(
                                            'SampleCarImageStep1',
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
                                        }
                                      },
                                      child: Container(
                                        height: 25.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                  '12.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .poppins(),
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  widget!.carConfig!.contains(
                                                          widget!
                                                              .impoundCarParamSet
                                                              ?.improundCONTNOTYPE)
                                                      ? 'แผ่นเพลทรถ (ถ้ามี)'
                                                      : 'อื่นๆ (ถ้ามี)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .poppins(),
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.image,
                                                  color: Color(0xFF404040),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 12.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.74,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        final selectedMedia =
                                                            await selectMediaWithSourceBottomSheet(
                                                          context: context,
                                                          imageQuality: 30,
                                                          allowPhoto: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          safeSetState(() =>
                                                              _model.isDataUploading12 =
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
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
                                                                        ))
                                                                    .toList();
                                                          } finally {
                                                            _model.isDataUploading12 =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length) {
                                                            safeSetState(() {
                                                              _model.uploadedLocalFile12 =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                            });
                                                          } else {
                                                            safeSetState(() {});
                                                            return;
                                                          }
                                                        }

                                                        if (_model.uploadedLocalFile12 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile12
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3000),
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3000),
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFFE6400),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(),
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'สถานะ :',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        _model.uploadedLocalFile12 !=
                                                                    null &&
                                                                (_model
                                                                        .uploadedLocalFile12
                                                                        .bytes
                                                                        ?.isNotEmpty ??
                                                                    false)
                                                            ? 'อัพโหลดสำเร็จ'
                                                            : 'ยังไม่อัพโหลด',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(),
                                                                  letterSpacing:
                                                                      0.0,
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
                                                  if (_model.uploadedLocalFile12 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile12
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                color: Color(
                                                                    0xFFFAFAFA),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .check_circle_rounded,
                                                                color: Color(
                                                                    0xFF24BF03),
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
                                                          Icons.cancel_rounded,
                                                          color:
                                                              Color(0xFFE21C3D),
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
                                      if (_model.uploadedLocalFile12 != null &&
                                          (_model.uploadedLocalFile12.bytes
                                                  ?.isNotEmpty ??
                                              false)) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 12.0),
                                              child: Container(
                                                width: 200.0,
                                                height: 200.0,
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.uploadedLocalFile12
                                                                        .bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag12',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag12',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.uploadedLocalFile12
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    4.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              Colors.black,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 35.0,
                                                          fillColor:
                                                              Colors.white,
                                                          icon: Icon(
                                                            Icons.close_rounded,
                                                            color: Color(
                                                                0xFFFF0000),
                                                            size: 18.0,
                                                          ),
                                                          onPressed: () async {
                                                            safeSetState(() {
                                                              _model.isDataUploading12 =
                                                                  false;
                                                              _model.uploadedLocalFile12 =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []));
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                              if (functions.getBoolValueInJson(
                                      functions.getDataFromMapJson(
                                          functions.getDataFromMapJson(
                                              widget!.saveAccessRoleData,
                                              widget!.step),
                                          'allow_16_pic')) ??
                                  true)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            height: 25.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFAFAFA),
                                                    ),
                                                    child: Text(
                                                      'อื่นๆ (ถ้ามี)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 12.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 20,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.74,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              final selectedMedia =
                                                                  await selectMedia(
                                                                imageQuality:
                                                                    30,
                                                                multiImage:
                                                                    false,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                safeSetState(() =>
                                                                    _model.isDataUploading13 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();
                                                                } finally {
                                                                  _model.isDataUploading13 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.uploadedLocalFile13 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              if (_model.uploadedLocalFile13 !=
                                                                      null &&
                                                                  (_model
                                                                          .uploadedLocalFile13
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปสำเร็จ!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                );
                                                                return;
                                                              }
                                                            },
                                                            text: 'อัพโหลดรูป',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 125.0,
                                                              height: 45.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFFFE6400),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'สถานะ :',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              _model.uploadedLocalFile13 !=
                                                                          null &&
                                                                      (_model
                                                                              .uploadedLocalFile13
                                                                              .bytes
                                                                              ?.isNotEmpty ??
                                                                          false)
                                                                  ? 'อัพโหลดสำเร็จ'
                                                                  : 'ยังไม่อัพโหลด',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
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
                                                        if (_model.uploadedLocalFile13 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile13
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)) {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFAFAFA),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_circle_rounded,
                                                                      color: Color(
                                                                          0xFF24BF03),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Container(
                                                              width: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFAFAFA),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .cancel_rounded,
                                                                color: Color(
                                                                    0xFFE21C3D),
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
                                            if (_model.uploadedLocalFile13 !=
                                                    null &&
                                                (_model.uploadedLocalFile13
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .memory(
                                                                      _model.uploadedLocalFile13
                                                                              .bytes ??
                                                                          Uint8List.fromList(
                                                                              []),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        'imageTag13',
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag: 'imageTag13',
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .memory(
                                                                  _model.uploadedLocalFile13
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    Colors
                                                                        .black,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    35.0,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  size: 18.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading13 =
                                                                        false;
                                                                    _model.uploadedLocalFile13 =
                                                                        FFUploadedFile(
                                                                            bytes:
                                                                                Uint8List.fromList([]));
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            height: 25.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFAFAFA),
                                                    ),
                                                    child: Text(
                                                      'อื่นๆ (ถ้ามี)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 12.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 20,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.74,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              final selectedMedia =
                                                                  await selectMedia(
                                                                imageQuality:
                                                                    30,
                                                                multiImage:
                                                                    false,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                safeSetState(() =>
                                                                    _model.isDataUploading14 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();
                                                                } finally {
                                                                  _model.isDataUploading14 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.uploadedLocalFile14 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              if (_model.uploadedLocalFile14 !=
                                                                      null &&
                                                                  (_model
                                                                          .uploadedLocalFile14
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปสำเร็จ!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                );
                                                                return;
                                                              }
                                                            },
                                                            text: 'อัพโหลดรูป',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 125.0,
                                                              height: 45.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFFFE6400),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'สถานะ :',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              _model.uploadedLocalFile14 !=
                                                                          null &&
                                                                      (_model
                                                                              .uploadedLocalFile14
                                                                              .bytes
                                                                              ?.isNotEmpty ??
                                                                          false)
                                                                  ? 'อัพโหลดสำเร็จ'
                                                                  : 'ยังไม่อัพโหลด',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
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
                                                        if (_model.uploadedLocalFile14 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile14
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)) {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFAFAFA),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_circle_rounded,
                                                                      color: Color(
                                                                          0xFF24BF03),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Container(
                                                              width: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFAFAFA),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .cancel_rounded,
                                                                color: Color(
                                                                    0xFFE21C3D),
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
                                            if (_model.uploadedLocalFile14 !=
                                                    null &&
                                                (_model.uploadedLocalFile14
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .memory(
                                                                      _model.uploadedLocalFile14
                                                                              .bytes ??
                                                                          Uint8List.fromList(
                                                                              []),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        'imageTag14',
                                                                    useHeroAnimation:
                                                                        true,
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .memory(
                                                                  _model.uploadedLocalFile14
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    Colors
                                                                        .black,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    35.0,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  size: 18.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading13 =
                                                                        false;
                                                                    _model.uploadedLocalFile13 =
                                                                        FFUploadedFile(
                                                                            bytes:
                                                                                Uint8List.fromList([]));
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            height: 25.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFAFAFA),
                                                    ),
                                                    child: Text(
                                                      'อื่นๆ (ถ้ามี)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 12.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 20,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.74,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              final selectedMedia =
                                                                  await selectMedia(
                                                                imageQuality:
                                                                    30,
                                                                multiImage:
                                                                    false,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                safeSetState(() =>
                                                                    _model.isDataUploading15 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();
                                                                } finally {
                                                                  _model.isDataUploading15 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.uploadedLocalFile15 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              if (_model.uploadedLocalFile15 !=
                                                                      null &&
                                                                  (_model
                                                                          .uploadedLocalFile15
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปสำเร็จ!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                );
                                                                return;
                                                              }
                                                            },
                                                            text: 'อัพโหลดรูป',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 125.0,
                                                              height: 45.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFFFE6400),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'สถานะ :',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              _model.uploadedLocalFile15 !=
                                                                          null &&
                                                                      (_model
                                                                              .uploadedLocalFile15
                                                                              .bytes
                                                                              ?.isNotEmpty ??
                                                                          false)
                                                                  ? 'อัพโหลดสำเร็จ'
                                                                  : 'ยังไม่อัพโหลด',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
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
                                                        if (_model.uploadedLocalFile15 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile15
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)) {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFAFAFA),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_circle_rounded,
                                                                      color: Color(
                                                                          0xFF24BF03),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Container(
                                                              width: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFAFAFA),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .cancel_rounded,
                                                                color: Color(
                                                                    0xFFE21C3D),
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
                                            if (_model.uploadedLocalFile15 !=
                                                    null &&
                                                (_model.uploadedLocalFile15
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .memory(
                                                                      _model.uploadedLocalFile15
                                                                              .bytes ??
                                                                          Uint8List.fromList(
                                                                              []),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        'imageTag15',
                                                                    useHeroAnimation:
                                                                        true,
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .memory(
                                                                  _model.uploadedLocalFile15
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    Colors
                                                                        .black,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    35.0,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  size: 18.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading13 =
                                                                        false;
                                                                    _model.uploadedLocalFile13 =
                                                                        FFUploadedFile(
                                                                            bytes:
                                                                                Uint8List.fromList([]));
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            height: 25.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFAFAFA),
                                                    ),
                                                    child: Text(
                                                      'อื่นๆ (ถ้ามี)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 12.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 20,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.74,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              final selectedMedia =
                                                                  await selectMedia(
                                                                imageQuality:
                                                                    30,
                                                                multiImage:
                                                                    false,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                safeSetState(() =>
                                                                    _model.isDataUploading16 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();
                                                                } finally {
                                                                  _model.isDataUploading16 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.uploadedLocalFile16 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              if (_model.uploadedLocalFile16 !=
                                                                      null &&
                                                                  (_model
                                                                          .uploadedLocalFile16
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปสำเร็จ!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
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
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                );
                                                                return;
                                                              }
                                                            },
                                                            text: 'อัพโหลดรูป',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 125.0,
                                                              height: 45.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFFFE6400),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'สถานะ :',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              _model.uploadedLocalFile16 !=
                                                                          null &&
                                                                      (_model
                                                                              .uploadedLocalFile16
                                                                              .bytes
                                                                              ?.isNotEmpty ??
                                                                          false)
                                                                  ? 'อัพโหลดสำเร็จ'
                                                                  : 'ยังไม่อัพโหลด',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(),
                                                                    letterSpacing:
                                                                        0.0,
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
                                                        if (_model.uploadedLocalFile16 !=
                                                                null &&
                                                            (_model
                                                                    .uploadedLocalFile16
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)) {
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFAFAFA),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_circle_rounded,
                                                                      color: Color(
                                                                          0xFF24BF03),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Container(
                                                              width: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFAFAFA),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .cancel_rounded,
                                                                color: Color(
                                                                    0xFFE21C3D),
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
                                            if (_model.uploadedLocalFile16 !=
                                                    null &&
                                                (_model.uploadedLocalFile16
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .memory(
                                                                      _model.uploadedLocalFile16
                                                                              .bytes ??
                                                                          Uint8List.fromList(
                                                                              []),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        'imageTag16',
                                                                    useHeroAnimation:
                                                                        true,
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .memory(
                                                                  _model.uploadedLocalFile16
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    Colors
                                                                        .black,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    35.0,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  size: 18.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading13 =
                                                                        false;
                                                                    _model.uploadedLocalFile13 =
                                                                        FFUploadedFile(
                                                                            bytes:
                                                                                Uint8List.fromList([]));
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (((FFAppState().profileLevel == 'สาขา') ||
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
                                              FFAppState().profileLevel)
                                          : functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .saveAccessRoleData,
                                                      widget!.step),
                                                  'price_edit_role'),
                                              widget!.userRoleSave)) ??
                                      true)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 20.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'ราคา',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.poppins(),
                                                      color: Color(0xFF404040),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFFFF0000),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    );
                                                  } else {
                                                    return Text(
                                                      '(ถ้ามี)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 8.0, 15.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0xFF404040),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .priceTextFieldTextController,
                                                      focusNode: _model
                                                          .priceTextFieldFocusNode,
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: 'กรอกราคา...',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: null,
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true),
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
                                          'หมายเหตุ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(),
                                                color: Color(0xFF404040),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          '(ถ้ามี)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(),
                                                color: Color(0xFF404040),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 8.0, 15.0, 0.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 137.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF404040),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .remarkTextFieldTextController,
                                                focusNode: _model
                                                    .remarkTextFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(),
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'กรอกหมายเหตุ...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .poppins(),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.poppins(),
                                                      letterSpacing: 0.0,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: 69.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          if (!((_model.uploadedLocalFile1 != null &&
                                  (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile2 != null &&
                                  (_model.uploadedLocalFile2.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile3 != null &&
                                  (_model.uploadedLocalFile3.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile4 != null &&
                                  (_model.uploadedLocalFile4.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile5 != null &&
                                  (_model.uploadedLocalFile5.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile6 != null &&
                                  (_model.uploadedLocalFile6.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile7 != null &&
                                  (_model.uploadedLocalFile7.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile8 != null &&
                                  (_model.uploadedLocalFile8.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile9 != null &&
                                  (_model.uploadedLocalFile9.bytes?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile10 != null &&
                                  (_model.uploadedLocalFile10.bytes
                                          ?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile11 != null &&
                                  (_model.uploadedLocalFile11.bytes
                                          ?.isNotEmpty ??
                                      false)) ||
                              (_model.uploadedLocalFile12 != null &&
                                  (_model.uploadedLocalFile12.bytes
                                          ?.isNotEmpty ??
                                      false)))) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content:
                                        Text('กรุณาอัพโหลดรูปอย่างน้อย 1 รูป'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
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
                          if (functions.getBoolValueInJson(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, widget!.step),
                                  'price_is_required'))!) {
                            if (!((_model.priceTextFieldTextController.text !=
                                    '') &&
                                functions.validatePriceImpound(
                                    functions.removeCommaFromNumText(_model
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                            if (!(double.parse(functions.removeCommaFromNumText(
                                    _model.priceTextFieldTextController.text)) >
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                          } else {
                            if (_model.priceTextFieldTextController.text !=
                                '') {
                              if (!(double.parse(
                                      functions.removeCommaFromNumText(_model
                                          .priceTextFieldTextController.text)) >
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
                                      .priceTextFieldTextController.text))!) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณากรอกราคาไม่เกิน 8 หลัก'),
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

                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      content: Text(
                                          'คุณต้องการจะบันทึกข้อมูลหรือไม่?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('ยกเลิก'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
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
                                    padding: MediaQuery.viewInsetsOf(context),
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
                                ..impoundPrice = ((FFAppState().profileLevel ==
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
                                    ? (_model.priceTextFieldTextController.text != ''
                                        ? functions.removeCommaFromNumText(_model
                                            .priceTextFieldTextController.text)
                                        : '0.00')
                                    : '0.00',
                            );
                            safeSetState(() {});
                          }
                          _model.uploadGoogleDriveApiOutput =
                              await UploadImagesGoogleDriveGroup
                                  .uploadGoogleDriveAPICall
                                  .call(
                            projectName:
                                false ? 'impound_car_dev_test' : 'impound_car',
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
                            remark: (_model.remarkTextFieldTextController
                                                .text !=
                                            null &&
                                        _model.remarkTextFieldTextController
                                                .text !=
                                            '') &&
                                    (_model.remarkTextFieldTextController
                                            .text !=
                                        '')
                                ? '${_model.remarkTextFieldTextController.text}'
                                : '',
                            images1: _model.uploadedLocalFile1,
                            images2: _model.uploadedLocalFile2,
                            images3: _model.uploadedLocalFile3,
                            images4: _model.uploadedLocalFile4,
                            images5: _model.uploadedLocalFile5,
                            images6: _model.uploadedLocalFile6,
                            images7: _model.uploadedLocalFile7,
                            images8: _model.uploadedLocalFile8,
                            images9: _model.uploadedLocalFile9,
                            images10: _model.uploadedLocalFile10,
                            images11: _model.uploadedLocalFile11,
                            images12: _model.uploadedLocalFile12,
                            cuscod: widget!.impoundCarParamSet?.improundCUSCOD,
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
                                .impoundCarLocateParamSet?.improundcarLocatId,
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
                            arnow: widget!.impoundCarParamSet?.improundARNOW,
                            constat:
                                widget!.impoundCarParamSet?.improundCONTSTAT,
                            typecod:
                                widget!.impoundCarParamSet?.improundTYPECOD,
                            modelcod:
                                widget!.impoundCarParamSet?.improundMODELCOD,
                            colorcod:
                                widget!.impoundCarParamSet?.improudCOLORCOD,
                            address: widget!.impoundCarLocateParamSet?.address,
                            subDistrict:
                                widget!.impoundCarLocateParamSet?.subDistrict,
                            district:
                                widget!.impoundCarLocateParamSet?.district,
                            province:
                                widget!.impoundCarLocateParamSet?.province,
                            postcode:
                                widget!.impoundCarLocateParamSet?.postcode,
                            phoneNumber:
                                widget!.impoundCarLocateParamSet?.phoneNumber,
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
                            regionCode:
                                widget!.impoundCarLocateParamSet?.regionCode,
                            regionName:
                                widget!.impoundCarLocateParamSet?.regionName,
                            keyincshprc:
                                widget!.impoundCarParamSet?.improundKEYINCSHPRC,
                            engno: widget!.impoundCarParamSet?.improundENGNO,
                            impoundEmp: '',
                            impoundDate: '',
                            impoundNameth: '',
                            impoundcarPrice: ((FFAppState().profileLevel ==
                                            'สาขา') ||
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
                                        widget!.userRoleSave)!)
                                ? (_model.priceTextFieldTextController.text !=
                                        ''
                                    ? functions.removeCommaFromNumText(_model
                                        .priceTextFieldTextController.text)
                                    : '0.00')
                                : '0.00',
                            images13: _model.uploadedLocalFile13,
                            images14: _model.uploadedLocalFile14,
                            images15: _model.uploadedLocalFile15,
                            images16: _model.uploadedLocalFile16,
                            locatDelivercar: ((FFAppState().profileLevel ==
                                            'สาขา') ||
                                        (FFAppState().profileLevel == 'เขต') ||
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
                                ? widget!
                                    .impoundCarLocateParamSet?.deliverLocateCode
                                : '',
                            locatNameDelivercar: ((FFAppState().profileLevel ==
                                            'สาขา') ||
                                        (FFAppState().profileLevel == 'เขต') ||
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
                                ? widget!
                                    .impoundCarLocateParamSet?.deliverLocateName
                                : '',
                            logisticsComany: ((FFAppState().profileLevel ==
                                            'สาขา') ||
                                        (FFAppState().profileLevel == 'เขต') ||
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
                                ? widget!
                                    .impoundCarLocateParamSet?.logisticsCompany
                                : '',
                            receiver: ((FFAppState().profileLevel == 'สาขา') ||
                                        (FFAppState().profileLevel == 'เขต') ||
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
                            dbCode: widget!.impoundCarParamSet?.impoundDbCode,
                            dbName: widget!.impoundCarParamSet?.impoundDbName,
                          );

                          _shouldSetState = true;
                          if ((_model.uploadGoogleDriveApiOutput?.statusCode ??
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
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
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
                                (_model.uploadGoogleDriveApiOutput?.jsonBody ??
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
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
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
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                          Navigator.pop(context);

                          context.goNamed(
                            'customerCarDeailsPictureStep1',
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
                          width: double.infinity,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFFF6D00),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.poppins(),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
