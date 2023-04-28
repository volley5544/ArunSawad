import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_learning_model.dart';
export 'e_learning_model.dart';

class ELearningWidget extends StatefulWidget {
  const ELearningWidget({Key? key}) : super(key: key);

  @override
  _ELearningWidgetState createState() => _ELearningWidgetState();
}

class _ELearningWidgetState extends State<ELearningWidget> {
  late ELearningModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ELearningModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'E-learning'});
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
            'E-learning',
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
                child: Html(
                  data:
                      '<!DOCTYPE html>  \n<html>  \n<title>Javascript API</title>  \n<body>  \n\n<h1>My Tableau Viz</h1>  \n\n<script type=\'module\' src=\'https://bireport.srisawadpower.com/javascripts/api/tableau.embedding.3.latest.min.js\'></script><tableau-viz id=\'tableau-viz\' src=\'https://bireport.srisawadpower.com/views/EmployeeInsurancePerformance/Top_10_Sales\' width=\'575\' height=\'850\' toolbar=\'bottom\' ></tableau-viz>\n\n<h1>My Tableau Viz</h1>\n\n</body>\n</html>',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
