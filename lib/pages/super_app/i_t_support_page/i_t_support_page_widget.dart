import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'i_t_support_page_model.dart';
export 'i_t_support_page_model.dart';

class ITSupportPageWidget extends StatefulWidget {
  const ITSupportPageWidget({super.key});

  @override
  State<ITSupportPageWidget> createState() => _ITSupportPageWidgetState();
}

class _ITSupportPageWidgetState extends State<ITSupportPageWidget> {
  late ITSupportPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ITSupportPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ITSupportPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
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
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'IT_Support',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogITSupport = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'IT_Support',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      await Future.delayed(const Duration(milliseconds: 2000));
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              'ข้อมูลไอที',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: FlutterFlowWebView(
                  content:
                      'https://sites.google.com/srisawadpower.com/it-support-center/Home',
                  bypass: true,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  verticalScroll: true,
                  horizontalScroll: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
