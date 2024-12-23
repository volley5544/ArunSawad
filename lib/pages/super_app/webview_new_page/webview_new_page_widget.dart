import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'webview_new_page_model.dart';
export 'webview_new_page_model.dart';

class WebviewNewPageWidget extends StatefulWidget {
  const WebviewNewPageWidget({
    super.key,
    required this.webUrl,
  });

  final String? webUrl;

  @override
  State<WebviewNewPageWidget> createState() => _WebviewNewPageWidgetState();
}

class _WebviewNewPageWidgetState extends State<WebviewNewPageWidget> {
  late WebviewNewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebviewNewPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WebviewNewPage'});
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

      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(
                  '${widget!.webUrl}?employeeId=${FFAppState().employeeID}&branchCodeSearch=${FFAppState().profileBranch}&token=${FFAppState().accessToken}&level=${FFAppState().profileLevel}'),
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
      await Future.delayed(const Duration(milliseconds: 3000));
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
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: Color(0xFFFF6500),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.goNamed('SuperAppPage');
                },
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
                      content:
                          '${widget!.webUrl}?employeeId=${FFAppState().employeeID}&branchCodeSearch=${FFAppState().profileBranch}&token=${FFAppState().accessToken}&level=${FFAppState().profileLevel}',
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
