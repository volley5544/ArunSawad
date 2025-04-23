import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(widget!.filePath!),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
    });

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
      child: custom_widgets.PdfViewerCustomWidget(
        width: double.infinity,
        height: double.infinity,
        horizontalScroll: false,
      ),
    );
  }
}
