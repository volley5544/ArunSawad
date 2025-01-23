import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data_not_found_component_model.dart';
export 'data_not_found_component_model.dart';

class DataNotFoundComponentWidget extends StatefulWidget {
  const DataNotFoundComponentWidget({super.key});

  @override
  State<DataNotFoundComponentWidget> createState() =>
      _DataNotFoundComponentWidgetState();
}

class _DataNotFoundComponentWidgetState
    extends State<DataNotFoundComponentWidget> {
  late DataNotFoundComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataNotFoundComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          'ไม่พบข้อมูล',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.poppins(),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 20.0,
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
