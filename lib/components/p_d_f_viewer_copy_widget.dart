import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PDFViewerCopyWidget extends StatefulWidget {
  const PDFViewerCopyWidget({Key? key}) : super(key: key);

  @override
  _PDFViewerCopyWidgetState createState() => _PDFViewerCopyWidgetState();
}

class _PDFViewerCopyWidgetState extends State<PDFViewerCopyWidget> {
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
                height: 600,
                horizontalScroll: false,
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: FaIcon(
                  FontAwesomeIcons.times,
                  color: Color(0xFFFF0000),
                  size: 30,
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
