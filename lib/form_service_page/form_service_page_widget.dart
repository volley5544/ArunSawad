import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

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
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserLogRecord? createdUserLogFormService;
  bool? checkLatLngFormService;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: double.infinity,
              child: LoadingSceneWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));

      checkLatLngFormService = await actions.a8(
        currentUserLocationValue,
      );
      if (!checkLatLngFormService!) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ระบบ'),
              content: Text('กรุณาเปิดGPS ก่อนทำรายการ'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        context.pop();
        return;
      }

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
      createdUserLogFormService = UserLogRecord.getDocumentFromData(
          userLogCreateData, userLogRecordReference);
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6500),
        automaticallyImplyLeading: false,
        leading: Visibility(
          visible: !FFAppState().isFromTimesheetPage,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: InkWell(
              onTap: () async {
                context.goNamed('SuperAppPage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFBFFFFFF),
                size: 30,
              ),
            ),
          ),
        ),
        title: Text(
          valueOrDefault<String>(
            widget.formServiceName,
            '[form_service_name]',
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 10,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
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
    );
  }
}
