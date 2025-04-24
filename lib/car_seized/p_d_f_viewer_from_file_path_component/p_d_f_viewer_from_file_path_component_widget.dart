import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_d_f_viewer_from_file_path_component_model.dart';
export 'p_d_f_viewer_from_file_path_component_model.dart';

class PDFViewerFromFilePathComponentWidget extends StatefulWidget {
  const PDFViewerFromFilePathComponentWidget({
    super.key,
    required this.filePath,
  });

  final String? filePath;

  @override
  State<PDFViewerFromFilePathComponentWidget> createState() =>
      _PDFViewerFromFilePathComponentWidgetState();
}

class _PDFViewerFromFilePathComponentWidgetState
    extends State<PDFViewerFromFilePathComponentWidget> {
  late PDFViewerFromFilePathComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFViewerFromFilePathComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.PdfViewerCustomWidget(
              width: double.infinity,
              height: double.infinity,
              assetPath: widget!.filePath,
              horizontalScroll: false,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close_outlined,
                color: FlutterFlowTheme.of(context).error,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
