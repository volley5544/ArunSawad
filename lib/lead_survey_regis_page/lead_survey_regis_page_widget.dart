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
import 'lead_survey_regis_page_model.dart';
export 'lead_survey_regis_page_model.dart';

class LeadSurveyRegisPageWidget extends StatefulWidget {
  const LeadSurveyRegisPageWidget({Key? key}) : super(key: key);

  @override
  _LeadSurveyRegisPageWidgetState createState() =>
      _LeadSurveyRegisPageWidgetState();
}

class _LeadSurveyRegisPageWidgetState extends State<LeadSurveyRegisPageWidget> {
  late LeadSurveyRegisPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadSurveyRegisPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LeadSurveyRegisPage'});
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
        action: 'Lead_Regis',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      );
      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(userLogCreateData);
      _model.createdLeadRegisLog = UserLogRecord.getDocumentFromData(
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
              'ฟอร์มลีด',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
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
                  url: FFAppState().QRCodeLink,
                  bypass: false,
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
