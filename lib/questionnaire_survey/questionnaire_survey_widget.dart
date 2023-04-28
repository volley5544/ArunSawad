import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'questionnaire_survey_model.dart';
export 'questionnaire_survey_model.dart';

class QuestionnaireSurveyWidget extends StatefulWidget {
  const QuestionnaireSurveyWidget({Key? key}) : super(key: key);

  @override
  _QuestionnaireSurveyWidgetState createState() =>
      _QuestionnaireSurveyWidgetState();
}

class _QuestionnaireSurveyWidgetState extends State<QuestionnaireSurveyWidget> {
  late QuestionnaireSurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionnaireSurveyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuestionnaireSurvey'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6500),
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 24.0,
          ),
          title: Text(
            'Questionnaire / Survey',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterFlowWebView(
                  url: 'https://flutter.dev',
                  bypass: false,
                  height: MediaQuery.of(context).size.height * 1.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
