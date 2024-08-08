import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'capture_camera_widget_model.dart';
export 'capture_camera_widget_model.dart';

class CaptureCameraWidgetWidget extends StatefulWidget {
  const CaptureCameraWidgetWidget({super.key});

  @override
  State<CaptureCameraWidgetWidget> createState() =>
      _CaptureCameraWidgetWidgetState();
}

class _CaptureCameraWidgetWidgetState extends State<CaptureCameraWidgetWidget> {
  late CaptureCameraWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaptureCameraWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Screenshot_1722589700.png',
                ).image,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              Icons.photo_camera_outlined,
              color: FlutterFlowTheme.of(context).accent2,
              size: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
