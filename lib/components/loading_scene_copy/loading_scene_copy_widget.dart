import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_scene_copy_model.dart';
export 'loading_scene_copy_model.dart';

class LoadingSceneCopyWidget extends StatefulWidget {
  const LoadingSceneCopyWidget({super.key});

  @override
  State<LoadingSceneCopyWidget> createState() => _LoadingSceneCopyWidgetState();
}

class _LoadingSceneCopyWidgetState extends State<LoadingSceneCopyWidget> {
  late LoadingSceneCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingSceneCopyModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x80000000),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Image.asset(
              'assets/images/Spin-1s-200px_(1).gif',
              width: 120.0,
              height: 120.0,
              fit: BoxFit.scaleDown,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Image.asset(
              'assets/images/Load-54x54-02.gif',
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.3),
            child: SelectionArea(
                child: Text(
              'กำลังบันทึกรูปลง Gallery เครื่อง\nกรุณารอซักครู่',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
            )),
          ),
        ],
      ),
    );
  }
}
