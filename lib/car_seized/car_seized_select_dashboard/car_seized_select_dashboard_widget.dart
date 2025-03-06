import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'car_seized_select_dashboard_model.dart';
export 'car_seized_select_dashboard_model.dart';

class CarSeizedSelectDashboardWidget extends StatefulWidget {
  const CarSeizedSelectDashboardWidget({super.key});

  static String routeName = 'CarSeizedSelectDashboard';
  static String routePath = 'carSeizedSelectDashboard';

  @override
  State<CarSeizedSelectDashboardWidget> createState() =>
      _CarSeizedSelectDashboardWidgetState();
}

class _CarSeizedSelectDashboardWidgetState
    extends State<CarSeizedSelectDashboardWidget> {
  late CarSeizedSelectDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarSeizedSelectDashboardModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CarSeizedSelectDashboard'});
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
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.urlLinkStorage = await queryUrlLinkStorageRecordOnce(
        queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where(
          'url_name',
          isEqualTo: 'impround_url',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().improundUrl = false
          ? 'https://dev.swpfin.com:7077'
          : _model.urlLinkStorage!.urlLink;
      safeSetState(() {});
      _model.urlLinkStorageVloan = await queryUrlLinkStorageRecordOnce(
        queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where(
          'url_name',
          isEqualTo: 'impound_car_vloan',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().impoundUrlVloan = false
          ? 'https://is-dev.swpfin.com/ssw_survey'
          : _model.urlLinkStorageVloan!.urlLink;
      FFAppState().impoundUrlVloanToken = false
          ? 'xhJfdKPYnhicbDsC8YpPiOSyoA3ugBGqVXE1Bf9Ufnk=%'
          : _model.urlLinkStorageVloan!.urlToken;
      safeSetState(() {});
      _model.getDataCollection = await actions.getDataFromCollection(
        'role_menu',
      );
      _model.readAccessRoleData = functions.getDataFromMapJson(
          _model.getDataCollection, 'impoundCarReadAccessRole');
      _model.writeAccessRoleData = functions.getDataFromMapJson(
          _model.getDataCollection, 'impoundCarSaveAccessRole');
      _model.editAccessRoleData = functions.getDataFromMapJson(
          _model.getDataCollection, 'impoundCarEditAccessRole');
      safeSetState(() {});
      _model.userRoleRead = functions.impoundCargetRoleName(
          _model.readAccessRoleData, FFAppState().employeeID)!;
      _model.userRoleSave = functions.impoundCargetRoleName(
          _model.writeAccessRoleData, FFAppState().employeeID)!;
      _model.userRoleEdit = functions.impoundCargetRoleName(
          _model.editAccessRoleData, FFAppState().employeeID)!;
      safeSetState(() {});
      _model.carConfig = functions
          .getDataFromMapJsonToList(
              _model.getDataCollection, 'impound_C_config')!
          .toList()
          .cast<String>();
      _model.motocycleConfig = functions
          .getDataFromMapJsonToList(
              _model.getDataCollection, 'impound_M_config')!
          .toList()
          .cast<String>();
      safeSetState(() {});
      Navigator.pop(context);
    });

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
              context.goNamed(SuperAppPageWidget.routeName);
            },
          ),
          title: Text(
            'การเก็บรูปรถยึด',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  if (((FFAppState().profileLevel == 'สาขา') ||
                              (FFAppState().profileLevel == 'เขต') ||
                              (FFAppState().profileLevel == 'ภาค')
                          ? functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  _model.writeAccessRoleData, 'profile_level'),
                              FFAppState().profileLevel)
                          : (_model.userRoleSave != 'no_role')) ??
                      true)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          CarSeizedDashboardPageWidget.routeName,
                          queryParameters: {
                            'fromPage': serializeParam(
                              'takeImages',
                              ParamType.String,
                            ),
                            'readAccessRoleData': serializeParam(
                              _model.readAccessRoleData,
                              ParamType.JSON,
                            ),
                            'saveAccessRoleData': serializeParam(
                              _model.writeAccessRoleData,
                              ParamType.JSON,
                            ),
                            'userRoleRead': serializeParam(
                              _model.userRoleRead,
                              ParamType.String,
                            ),
                            'userRoleSave': serializeParam(
                              _model.userRoleSave,
                              ParamType.String,
                            ),
                            'carConfig': serializeParam(
                              _model.carConfig,
                              ParamType.String,
                              isList: true,
                            ),
                            'motocycleConfig': serializeParam(
                              _model.motocycleConfig,
                              ParamType.String,
                              isList: true,
                            ),
                            'editAccessRoleData': serializeParam(
                              _model.editAccessRoleData,
                              ParamType.JSON,
                            ),
                            'userRoleEdit': serializeParam(
                              _model.userRoleEdit,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.43,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'ถ่ายรูปรถยึด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF204A77),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (((FFAppState().profileLevel == 'สาขา') ||
                              (FFAppState().profileLevel == 'เขต') ||
                              (FFAppState().profileLevel == 'ภาค')
                          ? functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  _model.readAccessRoleData, 'profile_level'),
                              FFAppState().profileLevel)
                          : (_model.userRoleRead != 'no_role')) ??
                      true)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          CarSeizedDashboardPageWidget.routeName,
                          queryParameters: {
                            'fromPage': serializeParam(
                              'seeImages',
                              ParamType.String,
                            ),
                            'readAccessRoleData': serializeParam(
                              _model.readAccessRoleData,
                              ParamType.JSON,
                            ),
                            'saveAccessRoleData': serializeParam(
                              _model.writeAccessRoleData,
                              ParamType.JSON,
                            ),
                            'userRoleRead': serializeParam(
                              _model.userRoleRead,
                              ParamType.String,
                            ),
                            'userRoleSave': serializeParam(
                              _model.userRoleSave,
                              ParamType.String,
                            ),
                            'carConfig': serializeParam(
                              _model.carConfig,
                              ParamType.String,
                              isList: true,
                            ),
                            'motocycleConfig': serializeParam(
                              _model.motocycleConfig,
                              ParamType.String,
                              isList: true,
                            ),
                            'editAccessRoleData': serializeParam(
                              _model.editAccessRoleData,
                              ParamType.JSON,
                            ),
                            'userRoleEdit': serializeParam(
                              _model.userRoleEdit,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.43,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                4.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: Color(0xFF354052),
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'ดูรูปรถยึด',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFF204A77),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (((FFAppState().profileLevel == 'สาขา') ||
                              (FFAppState().profileLevel == 'เขต') ||
                              (FFAppState().profileLevel == 'ภาค')
                          ? functions.containsValueInJsonList(
                              functions.getDataFromMapJson(
                                  _model.editAccessRoleData, 'profile_level'),
                              FFAppState().profileLevel)
                          : (_model.userRoleEdit != 'no_role')) ??
                      true)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          CarSeizedDashboardPageWidget.routeName,
                          queryParameters: {
                            'fromPage': serializeParam(
                              'changeCarLocation',
                              ParamType.String,
                            ),
                            'readAccessRoleData': serializeParam(
                              _model.readAccessRoleData,
                              ParamType.JSON,
                            ),
                            'saveAccessRoleData': serializeParam(
                              _model.writeAccessRoleData,
                              ParamType.JSON,
                            ),
                            'userRoleRead': serializeParam(
                              _model.userRoleRead,
                              ParamType.String,
                            ),
                            'userRoleSave': serializeParam(
                              _model.userRoleSave,
                              ParamType.String,
                            ),
                            'carConfig': serializeParam(
                              _model.carConfig,
                              ParamType.String,
                              isList: true,
                            ),
                            'motocycleConfig': serializeParam(
                              _model.motocycleConfig,
                              ParamType.String,
                              isList: true,
                            ),
                            'editAccessRoleData': serializeParam(
                              _model.editAccessRoleData,
                              ParamType.JSON,
                            ),
                            'userRoleEdit': serializeParam(
                              _model.userRoleEdit,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.43,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                4.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xFF354052),
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'แก้ไขข้อมูล',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFF204A77),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
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
          ),
        ),
      ),
    );
  }
}
