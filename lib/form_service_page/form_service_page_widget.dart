import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'form_service_page_model.dart';
export 'form_service_page_model.dart';

class FormServicePageWidget extends StatefulWidget {
  const FormServicePageWidget({
    Key? key,
    this.formServiceName,
    this.formServiceUrl,
  }) : super(key: key);

  final String? formServiceName;
  final String? formServiceUrl;

  @override
  _FormServicePageWidgetState createState() => _FormServicePageWidgetState();
}

class _FormServicePageWidgetState extends State<FormServicePageWidget> {
  late FormServicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormServicePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FormServicePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
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

      final userLogCreateData = createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: valueOrDefault<String>(
          'Form_Service_${widget.formServiceName}',
          '[form_service_action]',
        ),
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      );
      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(userLogCreateData);
      _model.createdUserLogFormService = UserLogRecord.getDocumentFromData(
          userLogCreateData, userLogRecordReference);
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.pop(context);
    });
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
              valueOrDefault<String>(
                widget.formServiceName,
                '[form_service_name]',
              ),
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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: FlutterFlowWebView(
                  url: valueOrDefault<String>(
                    widget.formServiceUrl,
                    'www.google.co.th',
                  ),
                  bypass: true,
                  height: MediaQuery.of(context).size.height * 0.9,
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
