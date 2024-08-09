import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'customer_car_deails_picture_step1_model.dart';
export 'customer_car_deails_picture_step1_model.dart';

class CustomerCarDeailsPictureStep1Widget extends StatefulWidget {
  const CustomerCarDeailsPictureStep1Widget({
    super.key,
    required this.improundCONTNO,
    required this.improundLOCAT,
    required this.improundTITLE,
    required this.improundFNAME,
    required this.improundSNAME,
    required this.improundREGNO,
    required this.improundREGPROV,
    required this.improundCONTNOTYPE,
    required this.improundCONTNOTYPENAME,
    required this.improundGCODE,
    required this.improundGDESC,
    required this.improundNumbody,
    required this.step,
    required this.improundCUSCOD,
    required this.readAccessRoleData,
    required this.saveAccessRoleData,
    required this.userRoleRead,
    required this.userRoleSave,
  });

  final String? improundCONTNO;
  final String? improundLOCAT;
  final String? improundTITLE;
  final String? improundFNAME;
  final String? improundSNAME;
  final String? improundREGNO;
  final String? improundREGPROV;
  final String? improundCONTNOTYPE;
  final String? improundCONTNOTYPENAME;
  final String? improundGCODE;
  final String? improundGDESC;
  final String? improundNumbody;
  final String? step;
  final String? improundCUSCOD;
  final dynamic readAccessRoleData;
  final dynamic saveAccessRoleData;
  final String? userRoleRead;
  final String? userRoleSave;

  @override
  State<CustomerCarDeailsPictureStep1Widget> createState() =>
      _CustomerCarDeailsPictureStep1WidgetState();
}

class _CustomerCarDeailsPictureStep1WidgetState
    extends State<CustomerCarDeailsPictureStep1Widget> {
  late CustomerCarDeailsPictureStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerCarDeailsPictureStep1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'customerCarDeailsPictureStep1'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.imagesAPIOutput =
          await UploadImagesGoogleDriveGroup.searchImagesCall.call(
        contNo: widget!.improundCONTNO,
        step: widget!.step,
        url: FFAppState().improundUrl,
      );

      if ((_model.imagesAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด ( ${(_model.imagesAPIOutput?.statusCode ?? 200).toString()})'),
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
        Navigator.pop(context);
        return;
      }
      if (UploadImagesGoogleDriveGroup.searchImagesCall.statuscode(
            (_model.imagesAPIOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    '${UploadImagesGoogleDriveGroup.searchImagesCall.message(
                  (_model.imagesAPIOutput?.jsonBody ?? ''),
                )}'),
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
        Navigator.pop(context);
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
      onTap: () => FocusScope.of(context).unfocus(),
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
                return 'ดูรูปยึดรถ';
              } else if (widget!.step == 'step2') {
                return 'ดูรูปส่งมอบรถ';
              } else if (widget!.step == 'step3') {
                return 'ดูรูปตั้งราคา';
              } else {
                return 'Title';
              }
            }(),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF003063),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            Visibility(
              visible: () {
                    if (widget!.step == 'step1') {
                      return ((FFAppState().profileLevel == 'สาขา') ||
                              (FFAppState().profileLevel == 'เขต') ||
                              (FFAppState().profileLevel == 'ภาค')
                          ? functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step1'),
                                  'Level'),
                              FFAppState().profileLevel)
                          : functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step1'),
                                  'role_name'),
                              widget!.userRoleSave));
                    } else if (widget!.step == 'step2') {
                      return ((FFAppState().profileLevel == 'สาขา') ||
                              (FFAppState().profileLevel == 'เขต') ||
                              (FFAppState().profileLevel == 'ภาค')
                          ? functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step2'),
                                  'Level'),
                              FFAppState().profileLevel)
                          : functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step2'),
                                  'role_name'),
                              widget!.userRoleSave));
                    } else if (widget!.step == 'step3') {
                      return ((FFAppState().profileLevel == 'สาขา') ||
                              (FFAppState().profileLevel == 'เขต') ||
                              (FFAppState().profileLevel == 'ภาค')
                          ? functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step3'),
                                  'Level'),
                              FFAppState().profileLevel)
                          : functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step3'),
                                  'role_name'),
                              widget!.userRoleSave));
                    } else if (widget!.step == 'step4') {
                      return ((FFAppState().profileLevel == 'สาขา') ||
                              (FFAppState().profileLevel == 'เขต') ||
                              (FFAppState().profileLevel == 'ภาค')
                          ? functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step4'),
                                  'Level'),
                              FFAppState().profileLevel)
                          : functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  functions.getDataFromMapJson(
                                      widget!.saveAccessRoleData, 'step4'),
                                  'role_name'),
                              widget!.userRoleSave));
                    } else {
                      return true;
                    }
                  }() ??
                  true,
              child: FlutterFlowIconButton(
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.edit_outlined,
                  color: Color(0xFFDB771A),
                  size: 30.0,
                ),
                onPressed: () async {
                  if (widget!.step == 'step4') {
                    context.pushNamed(
                      'CustomerCarDeailsStep4',
                      queryParameters: {
                        'improundCONTNO': serializeParam(
                          widget!.improundCONTNO,
                          ParamType.String,
                        ),
                        'improundLOCAT': serializeParam(
                          widget!.improundLOCAT,
                          ParamType.String,
                        ),
                        'improundTITLE': serializeParam(
                          widget!.improundTITLE,
                          ParamType.String,
                        ),
                        'improundFNAME': serializeParam(
                          widget!.improundFNAME,
                          ParamType.String,
                        ),
                        'improundSNAME': serializeParam(
                          widget!.improundSNAME,
                          ParamType.String,
                        ),
                        'improundREGNO': serializeParam(
                          widget!.improundREGNO,
                          ParamType.String,
                        ),
                        'improundREGPROV': serializeParam(
                          widget!.improundREGPROV,
                          ParamType.String,
                        ),
                        'improundCONTNOTYPE': serializeParam(
                          widget!.improundCONTNOTYPE,
                          ParamType.String,
                        ),
                        'improundCONTNOTYPENAME': serializeParam(
                          widget!.improundCONTNOTYPENAME,
                          ParamType.String,
                        ),
                        'improundGCODE': serializeParam(
                          widget!.improundGCODE,
                          ParamType.String,
                        ),
                        'improundGDESC': serializeParam(
                          widget!.improundGDESC,
                          ParamType.String,
                        ),
                        'improundNumbody': serializeParam(
                          widget!.improundNumbody,
                          ParamType.String,
                        ),
                        'step': serializeParam(
                          widget!.step,
                          ParamType.String,
                        ),
                        'improundCUSCOD': serializeParam(
                          widget!.improundCUSCOD,
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
                      }.withoutNulls,
                    );
                  } else {
                    context.pushNamed(
                      'CustomerCarDeailsStep1',
                      queryParameters: {
                        'improundCONTNO': serializeParam(
                          widget!.improundCONTNO,
                          ParamType.String,
                        ),
                        'improundLOCAT': serializeParam(
                          widget!.improundLOCAT,
                          ParamType.String,
                        ),
                        'improundTITLE': serializeParam(
                          widget!.improundTITLE,
                          ParamType.String,
                        ),
                        'improundFNAME': serializeParam(
                          widget!.improundFNAME,
                          ParamType.String,
                        ),
                        'improundSNAME': serializeParam(
                          widget!.improundSNAME,
                          ParamType.String,
                        ),
                        'improundREGNO': serializeParam(
                          widget!.improundREGNO,
                          ParamType.String,
                        ),
                        'improundREGPROV': serializeParam(
                          widget!.improundREGPROV,
                          ParamType.String,
                        ),
                        'improundCONTNOTYPE': serializeParam(
                          widget!.improundCONTNOTYPE,
                          ParamType.String,
                        ),
                        'improundCONTNOTYPENAME': serializeParam(
                          widget!.improundCONTNOTYPENAME,
                          ParamType.String,
                        ),
                        'improundGCODE': serializeParam(
                          widget!.improundGCODE,
                          ParamType.String,
                        ),
                        'improundGDESC': serializeParam(
                          widget!.improundGDESC,
                          ParamType.String,
                        ),
                        'improundNumbody': serializeParam(
                          widget!.improundNumbody,
                          ParamType.String,
                        ),
                        'step': serializeParam(
                          widget!.step,
                          ParamType.String,
                        ),
                        'improundCUSCOD': serializeParam(
                          widget!.improundCUSCOD,
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
                      }.withoutNulls,
                    );
                  }
                },
              ),
            ),
          ],
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
                                      fontFamily: 'Poppins',
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
                                      fontFamily: 'Poppins',
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
                              widget!.improundCONTNOTYPE == 'C'
                                  ? 'รถยนต์'
                                  : 'มอเตอร์ไซค์',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หน้าตรง',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '1',
                                        ParamType.String,
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
                                        child: Container(
                                          width: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Text(
                                            'หน้าตรง',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF404040),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images1(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images1(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          UploadImagesGoogleDriveGroup
                                                      .searchImagesCall
                                                      .images1(
                                                    (_model.imagesAPIOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  ''
                                              ? UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images1(
                                                  (_model.imagesAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                              : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: UploadImagesGoogleDriveGroup
                                                    .searchImagesCall
                                                    .images1(
                                                  (_model.imagesAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                ''
                                            ? UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images1(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                            : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images1(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images1(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images1(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images1(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หน้าซ้าย 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '2',
                                        ParamType.String,
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
                                        child: Container(
                                          width: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Text(
                                            'หน้าซ้าย 45 องศา',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF404040),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images2(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images2(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images2(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images2(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images2(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images2(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images2(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images2(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images2(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images2(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หลังซ้าย 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '3',
                                        ParamType.String,
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
                                        child: Container(
                                          width: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Text(
                                            'หลังซ้าย 45 องศา',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF404040),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images3(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images3(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images3(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images3(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images3(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images3(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images3(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images3(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images3(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images3(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หลังตรง',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '4',
                                        ParamType.String,
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
                                        child: Container(
                                          width: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Text(
                                            'หลังตรง',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF404040),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images4(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images4(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images4(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images4(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images4(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images4(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images4(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images4(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images4(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images4(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หลังขวา 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '5',
                                        ParamType.String,
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
                                        child: Container(
                                          width: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Text(
                                            'หลังขวา 45 องศา',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF404040),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images5(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images5(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images5(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images5(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images5(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images5(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images5(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images5(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images5(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images5(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หน้าขวา 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '6',
                                        ParamType.String,
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
                                        child: Container(
                                          width: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Text(
                                            'หน้าขวา 45 องศา',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF404040),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images6(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images6(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images6(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images6(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images6(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images6(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images6(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images6(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images6(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images6(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        widget!.improundCONTNOTYPE == 'C'
                                            ? 'เลขไมล์'
                                            : 'เลขตัวถังรถ',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '7',
                                        ParamType.String,
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
                                        child: Container(
                                          width: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Text(
                                            widget!.improundCONTNOTYPE == 'C'
                                                ? 'เลขไมล์'
                                                : 'เลขตัวถังรถ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF404040),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images7(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images7(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images7(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images7(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images7(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images7(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images7(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images7(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images7(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images7(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        widget!.improundCONTNOTYPE == 'C'
                                            ? 'คอนโซลหน้า'
                                            : 'เลขเครื่องยนต์',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '8',
                                        ParamType.String,
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
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                width: 37.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  widget!.improundCONTNOTYPE ==
                                                          'C'
                                                      ? 'คอนโซลหน้า'
                                                      : 'เลขเครื่องยนต์',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images8(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images8(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images8(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images8(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images8(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images8(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images8(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images8(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images8(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images8(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        widget!.improundCONTNOTYPE == 'C'
                                            ? 'เบาะหลัง'
                                            : 'เลขไมล์',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '9',
                                        ParamType.String,
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
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                width: 37.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  widget!.improundCONTNOTYPE ==
                                                          'C'
                                                      ? 'เบาะหลัง'
                                                      : 'เลขไมล์',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images9(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images9(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images9(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images9(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images9(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images9(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images9(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images9(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images9(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images9(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                  if (widget!.improundCONTNOTYPE != 'C') {
                                    return;
                                  }

                                  context.pushNamed(
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'เครื่องยนต์',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '10',
                                        ParamType.String,
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
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                width: 37.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  widget!.improundCONTNOTYPE ==
                                                          'C'
                                                      ? 'เครื่องยนต์'
                                                      : 'อื่นๆ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images10(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images10(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images10(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images10(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images10(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images10(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images10(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images10(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images10(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images10(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                  if (widget!.improundCONTNOTYPE != 'C') {
                                    return;
                                  }

                                  context.pushNamed(
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'เลขตัวถังรถ',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '11',
                                        ParamType.String,
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
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                width: 37.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  widget!.improundCONTNOTYPE ==
                                                          'C'
                                                      ? 'เลขตัวถังรถ'
                                                      : 'อื่นๆ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images11(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images11(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images11(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images1(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images11(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images1(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images11(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images1(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images11(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images1(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              flex: 2,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                  if (widget!.improundCONTNOTYPE != 'C') {
                                    return;
                                  }

                                  context.pushNamed(
                                    'SampleCarImageStep1',
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'แผ่นเพลทรถ',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '12',
                                        ParamType.String,
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
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                width: 37.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  widget!.improundCONTNOTYPE ==
                                                          'C'
                                                      ? 'แผ่นเพลทรถ'
                                                      : 'อื่นๆ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images12(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images12(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '') {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                    image: Image.network(
                                      UploadImagesGoogleDriveGroup
                                                  .searchImagesCall
                                                  .images12(
                                                (_model.imagesAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              ''
                                          ? UploadImagesGoogleDriveGroup
                                              .searchImagesCall
                                              .images12(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                          : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: UploadImagesGoogleDriveGroup
                                                .searchImagesCall
                                                .images12(
                                              (_model.imagesAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            ''
                                        ? UploadImagesGoogleDriveGroup
                                            .searchImagesCall
                                            .images12(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          )!
                                        : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: UploadImagesGoogleDriveGroup.searchImagesCall
                                          .images12(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? UploadImagesGoogleDriveGroup
                                      .searchImagesCall
                                      .images12(
                                      (_model.imagesAPIOutput?.jsonBody ?? ''),
                                    )!
                                  : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  UploadImagesGoogleDriveGroup.searchImagesCall
                                              .images12(
                                            (_model.imagesAPIOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''
                                      ? UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .images12(
                                          (_model.imagesAPIOutput?.jsonBody ??
                                              ''),
                                        )!
                                      : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
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
                              'หมายเหตุ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 8.0, 15.0, 0.0),
                              child: Container(
                                width: 100.0,
                                constraints: BoxConstraints(
                                  minHeight: 137.0,
                                ),
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
                                      12.0, 12.0, 12.0, 12.0),
                                  child: SelectionArea(
                                      child: Text(
                                    valueOrDefault<String>(
                                      UploadImagesGoogleDriveGroup
                                          .searchImagesCall
                                          .remark(
                                        (_model.imagesAPIOutput?.jsonBody ??
                                            ''),
                                      ),
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
