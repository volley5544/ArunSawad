import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_d_f_viewer_copy_model.dart';
export 'p_d_f_viewer_copy_model.dart';

class PDFViewerCopyWidget extends StatefulWidget {
  const PDFViewerCopyWidget({super.key});

  @override
  State<PDFViewerCopyWidget> createState() => _PDFViewerCopyWidgetState();
}

class _PDFViewerCopyWidgetState extends State<PDFViewerCopyWidget> {
  late PDFViewerCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFViewerCopyModel());

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
          Stack(
            children: [
              FlutterFlowPdfViewer(
                assetPath:
                    'assets/pdfs/_CRD_008-2565__Refinance__M_eff_14102565-v1_signed.pdf',
                width: double.infinity,
                height: 600.0,
                horizontalScroll: false,
              ),
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
        ],
      ),
    );
  }
}
