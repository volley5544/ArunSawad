import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_seized_dashboard_page_model.dart';
export 'car_seized_dashboard_page_model.dart';

class CarSeizedDashboardPageWidget extends StatefulWidget {
  const CarSeizedDashboardPageWidget({
    super.key,
    required this.fromPage,
    required this.readAccessRoleData,
    required this.saveAccessRoleData,
    String? userRoleRead,
    String? userRoleSave,
    required this.carConfig,
    required this.motocycleConfig,
    required this.editAccessRoleData,
    required this.userRoleEdit,
  })  : this.userRoleRead = userRoleRead ?? 'no_role',
        this.userRoleSave = userRoleSave ?? 'no_role';

  final String? fromPage;
  final dynamic readAccessRoleData;
  final dynamic saveAccessRoleData;
  final String userRoleRead;
  final String userRoleSave;
  final List<String>? carConfig;
  final List<String>? motocycleConfig;
  final dynamic editAccessRoleData;
  final String? userRoleEdit;

  @override
  State<CarSeizedDashboardPageWidget> createState() =>
      _CarSeizedDashboardPageWidgetState();
}

class _CarSeizedDashboardPageWidgetState
    extends State<CarSeizedDashboardPageWidget> {
  late CarSeizedDashboardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarSeizedDashboardPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CarSeizedDashboardPage'});
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
                if (() {
                      if (widget!.fromPage == 'takeImages') {
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
                      } else if (widget!.fromPage == 'changeCarLocation') {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step1'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step1'),
                                    'role_name'),
                                widget!.userRoleEdit));
                      } else {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step1'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step1'),
                                    'role_name'),
                                widget!.userRoleRead));
                      }
                    }() ??
                    true)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'searchCustomersGD',
                        queryParameters: {
                          'fromPage': serializeParam(
                            widget!.fromPage,
                            ParamType.String,
                          ),
                          'step': serializeParam(
                            'step1',
                            ParamType.String,
                          ),
                          'textShow': serializeParam(
                            () {
                              if (widget!.fromPage == 'takeImages') {
                                return 'ถ่ายรูปส่งเปลี่ยนเป้ารถยึด';
                              } else if (widget!.fromPage ==
                                  'changeCarLocation') {
                                return 'แก้ไขข้อมูลส่งเปลี่ยนเป้ารถยึด';
                              } else {
                                return 'ดูรูปส่งเปลี่ยนเป้ารถยึด';
                              }
                            }(),
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
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: 100.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget!.fromPage == 'takeImages')
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
                            if (widget!.fromPage == 'seeImages')
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
                                        Icons.image_search,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget!.fromPage == 'changeCarLocation')
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
                                        Icons.edit_sharp,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      () {
                                        if (widget!.fromPage == 'takeImages') {
                                          return 'ถ่ายรูป';
                                        } else if (widget!.fromPage ==
                                            'changeCarLocation') {
                                          return 'แก้ไขข้อมูล';
                                        } else {
                                          return 'ดูรูป';
                                        }
                                      }(),
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
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: (widget!.fromPage ==
                                              'changeCarLocation') ||
                                          (widget!.fromPage == 'takeImages') ||
                                          (widget!.fromPage == 'seeImages'),
                                      child: Text(
                                        () {
                                          if (widget!.fromPage ==
                                              'takeImages') {
                                            return 'ส่งเปลี่ยนเป้ารถยึด';
                                          } else if (widget!.fromPage ==
                                              'changeCarLocation') {
                                            return 'ส่งเปลี่ยนเป้ารถยึด';
                                          } else {
                                            return ' ส่งเปลี่ยนเป้ารถยึด';
                                          }
                                        }(),
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (() {
                      if (widget!.fromPage == 'takeImages') {
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
                      } else if (widget!.fromPage == 'changeCarLocation') {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step2'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step2'),
                                    'role_name'),
                                widget!.userRoleEdit));
                      } else {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step2'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step2'),
                                    'role_name'),
                                widget!.userRoleRead));
                      }
                    }() ??
                    true)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'searchCustomersGD',
                        queryParameters: {
                          'fromPage': serializeParam(
                            widget!.fromPage,
                            ParamType.String,
                          ),
                          'step': serializeParam(
                            'step2',
                            ParamType.String,
                          ),
                          'textShow': serializeParam(
                            () {
                              if (widget!.fromPage == 'takeImages') {
                                return 'ถ่ายรูปส่งมอบรถ';
                              } else if (widget!.fromPage ==
                                  'changeCarLocation') {
                                return 'แก้ไขข้อมูลส่งมอบรถ';
                              } else {
                                return 'ดูรูปส่งมอบรถ';
                              }
                            }(),
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
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: 100.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget!.fromPage == 'takeImages')
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
                            if (widget!.fromPage == 'seeImages')
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
                                        Icons.image_search,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget!.fromPage == 'changeCarLocation')
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
                                        Icons.edit_sharp,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    () {
                                      if (widget!.fromPage == 'takeImages') {
                                        return 'ถ่ายรูปส่งมอบรถ';
                                      } else if (widget!.fromPage ==
                                          'changeCarLocation') {
                                        return 'แก้ไขข้อมูล';
                                      } else {
                                        return 'ดูรูปส่งมอบรถ';
                                      }
                                    }(),
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
                                  if (widget!.fromPage == 'changeCarLocation')
                                    Text(
                                      () {
                                        if (widget!.fromPage == 'takeImages') {
                                          return 'รูปส่งมอบรถ';
                                        } else if (widget!.fromPage ==
                                            'changeCarLocation') {
                                          return 'รูปส่งมอบรถ';
                                        } else {
                                          return ' ';
                                        }
                                      }(),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (() {
                      if (widget!.fromPage == 'takeImages') {
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
                      } else if (widget!.fromPage == 'changeCarLocation') {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step3'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step3'),
                                    'role_name'),
                                widget!.userRoleEdit));
                      } else {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step3'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step3'),
                                    'role_name'),
                                widget!.userRoleRead));
                      }
                    }() ??
                    true)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'searchCustomersGD',
                        queryParameters: {
                          'fromPage': serializeParam(
                            widget!.fromPage,
                            ParamType.String,
                          ),
                          'step': serializeParam(
                            'step3',
                            ParamType.String,
                          ),
                          'textShow': serializeParam(
                            () {
                              if (widget!.fromPage == 'takeImages') {
                                return 'ถ่ายรูปตั้งราคา';
                              } else if (widget!.fromPage ==
                                  'changeCarLocation') {
                                return 'แก้ไขข้อมูลตั้งราคา';
                              } else {
                                return 'ดูรูปตั้งราคา';
                              }
                            }(),
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
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: 100.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget!.fromPage == 'takeImages')
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
                            if (widget!.fromPage == 'seeImages')
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
                                        Icons.image_search,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget!.fromPage == 'changeCarLocation')
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
                                        Icons.edit_sharp,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    () {
                                      if (widget!.fromPage == 'takeImages') {
                                        return 'ถ่ายรูปตั้งราคา';
                                      } else if (widget!.fromPage ==
                                          'changeCarLocation') {
                                        return 'แก้ไขข้อมูล';
                                      } else {
                                        return 'ดูรูปตั้งราคา';
                                      }
                                    }(),
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
                                  if (widget!.fromPage == 'changeCarLocation')
                                    Text(
                                      () {
                                        if (widget!.fromPage == 'takeImages') {
                                          return 'ถ่ายรูปตั้งราคา';
                                        } else if (widget!.fromPage ==
                                            'changeCarLocation') {
                                          return 'รูปตั้งราคา';
                                        } else {
                                          return ' ';
                                        }
                                      }(),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (() {
                      if (widget!.fromPage == 'takeImages') {
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
                      } else if (widget!.fromPage == 'changeCarLocation') {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step4'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.editAccessRoleData, 'step4'),
                                    'role_name'),
                                widget!.userRoleEdit));
                      } else {
                        return ((FFAppState().profileLevel == 'สาขา') ||
                                (FFAppState().profileLevel == 'เขต') ||
                                (FFAppState().profileLevel == 'ภาค')
                            ? functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step4'),
                                    'Level'),
                                FFAppState().profileLevel)
                            : functions.containsValueInJsonList(
                                functions.getDataFromMapJson(
                                    functions.getDataFromMapJson(
                                        widget!.readAccessRoleData, 'step4'),
                                    'role_name'),
                                widget!.userRoleRead));
                      }
                    }() ??
                    true)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'searchCustomersGD',
                        queryParameters: {
                          'fromPage': serializeParam(
                            widget!.fromPage,
                            ParamType.String,
                          ),
                          'step': serializeParam(
                            'step4',
                            ParamType.String,
                          ),
                          'textShow': serializeParam(
                            () {
                              if (widget!.fromPage == 'takeImages') {
                                return 'อัพโหลดรูปเข้าประมูล';
                              } else if (widget!.fromPage ==
                                  'changeCarLocation') {
                                return 'แก้ไขข้อมูลเข้าประมูล';
                              } else {
                                return 'ดูรูปเข้าประมูล';
                              }
                            }(),
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
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: 100.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget!.fromPage == 'takeImages')
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
                                        Icons.image,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget!.fromPage == 'seeImages')
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
                                        Icons.image_search,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget!.fromPage == 'changeCarLocation')
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
                                        Icons.edit_sharp,
                                        color: Color(0xFF354052),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    () {
                                      if (widget!.fromPage == 'takeImages') {
                                        return 'อัพโหลดรูปเข้าประมูล';
                                      } else if (widget!.fromPage ==
                                          'changeCarLocation') {
                                        return 'แก้ไขข้อมูล';
                                      } else {
                                        return 'ดูรูปเข้าประมูล';
                                      }
                                    }(),
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
                                  if (widget!.fromPage == 'changeCarLocation')
                                    Text(
                                      () {
                                        if (widget!.fromPage == 'takeImages') {
                                          return 'อัพโหลดรูปเข้าประมูล';
                                        } else if (widget!.fromPage ==
                                            'changeCarLocation') {
                                          return 'รูปเข้าประมูล';
                                        } else {
                                          return ' ';
                                        }
                                      }(),
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
                                ],
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
      ),
    );
  }
}
