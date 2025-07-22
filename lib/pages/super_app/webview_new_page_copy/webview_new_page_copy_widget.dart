import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'webview_new_page_copy_model.dart';
export 'webview_new_page_copy_model.dart';

class WebviewNewPageCopyWidget extends StatefulWidget {
  const WebviewNewPageCopyWidget({
    super.key,
    required this.webUrl,
    this.branchCodeSearch,
    this.levelSearch,
    this.regionAccessToken,
    this.regionEmployeeId,
  });

  final String? webUrl;
  final String? branchCodeSearch;
  final String? levelSearch;
  final String? regionAccessToken;
  final String? regionEmployeeId;

  static String routeName = 'WebviewNewPageCopy';
  static String routePath = 'webviewNewPageCopy';

  @override
  State<WebviewNewPageCopyWidget> createState() =>
      _WebviewNewPageCopyWidgetState();
}

class _WebviewNewPageCopyWidgetState extends State<WebviewNewPageCopyWidget> {
  late WebviewNewPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebviewNewPageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WebviewNewPageCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      );

      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
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

    return Builder(
      builder: (context) => GestureDetector(
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
            actions: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(SuperAppPageWidget.routeName);
                    },
                    child: Text(
                      'กลับหน้า Home',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFFF6500),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: false,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FlutterFlowWebView(
                      content: functions.containsValueInDataTypeList(
                              functions
                                  .getDataTypeFromJson(
                                      FFAppState().roleMenuJson,
                                      'adminRoleGroup')
                                  ?.toList(),
                              FFAppState().employeeID,
                              'ลูกค้าสนใจสินเชื่อบ้าน-ที่ดินTester')!
                          ? '${widget!.webUrl}?employeeId=${widget!.regionEmployeeId}&branchCodeSearch=${widget!.branchCodeSearch}&token=${widget!.regionAccessToken}&level=ภาค&mode=ภาค&projectName=Arunsawad'
                          : '${widget!.webUrl}?employeeId=${FFAppState().employeeID}&branchCodeSearch=${functions.containsValueInDataTypeList(functions.getDataTypeFromJson(FFAppState().roleMenuJson, 'adminRoleGroup')?.toList(), FFAppState().employeeID, 'ลูกค้าสนใจสินเชื่อบ้าน-ที่ดินAdmin')! ? widget!.branchCodeSearch : FFAppState().profileBranch}&token=${FFAppState().accessToken}&level=${FFAppState().profileLevel}&mode=${functions.containsValueInDataTypeList(functions.getDataTypeFromJson(FFAppState().roleMenuJson, 'adminRoleGroup')?.toList(), FFAppState().employeeID, 'ลูกค้าสนใจสินเชื่อบ้าน-ที่ดินAdmin')! ? widget!.levelSearch : FFAppState().profileLevel}&projectName=Arunsawad',
                      bypass: true,
                      height: 500.0,
                      verticalScroll: false,
                      horizontalScroll: false,
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
