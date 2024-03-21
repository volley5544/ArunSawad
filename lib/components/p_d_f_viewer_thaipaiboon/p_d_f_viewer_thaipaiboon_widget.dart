import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_d_f_viewer_thaipaiboon_model.dart';
export 'p_d_f_viewer_thaipaiboon_model.dart';

class PDFViewerThaipaiboonWidget extends StatefulWidget {
  const PDFViewerThaipaiboonWidget({
    super.key,
    this.thaipaiboonPdfLink,
  });

  final String? thaipaiboonPdfLink;

  @override
  State<PDFViewerThaipaiboonWidget> createState() =>
      _PDFViewerThaipaiboonWidgetState();
}

class _PDFViewerThaipaiboonWidgetState
    extends State<PDFViewerThaipaiboonWidget> {
  late PDFViewerThaipaiboonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFViewerThaipaiboonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: FaIcon(
                  FontAwesomeIcons.times,
                  color: Color(0xFFFF0000),
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Stack(
            children: [
              FlutterFlowPdfViewer(
                networkPath: widget.thaipaiboonPdfLink!,
                width: double.infinity,
                height: 600.0,
                horizontalScroll: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
