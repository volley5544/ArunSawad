import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'force_update_component_model.dart';
export 'force_update_component_model.dart';

class ForceUpdateComponentWidget extends StatefulWidget {
  const ForceUpdateComponentWidget({super.key});

  @override
  State<ForceUpdateComponentWidget> createState() =>
      _ForceUpdateComponentWidgetState();
}

class _ForceUpdateComponentWidgetState
    extends State<ForceUpdateComponentWidget> {
  late ForceUpdateComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForceUpdateComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(
              'assets/jsons/update.json',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
