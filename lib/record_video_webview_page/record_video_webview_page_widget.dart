import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'record_video_webview_page_model.dart';
export 'record_video_webview_page_model.dart';

class RecordVideoWebviewPageWidget extends StatefulWidget {
  const RecordVideoWebviewPageWidget({
    super.key,
    required this.webUrl,
  });

  final String? webUrl;

  @override
  State<RecordVideoWebviewPageWidget> createState() =>
      _RecordVideoWebviewPageWidgetState();
}

class _RecordVideoWebviewPageWidgetState
    extends State<RecordVideoWebviewPageWidget> {
  late RecordVideoWebviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordVideoWebviewPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RecordVideoWebviewPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6500),
          automaticallyImplyLeading: false,
          leading: InkWell(
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
          title: Text(
            'บันทึกวีดิโอ (ลูกค้า)',
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
            decoration: BoxDecoration(),
            child: Container(
              width: 300.0,
              height: 500.0,
              child: custom_widgets.VideoRecordWebWidget(
                width: 300.0,
                height: 500.0,
                webUrl: widget.webUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
