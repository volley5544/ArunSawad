import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_scene_model.dart';
export 'loading_scene_model.dart';

class LoadingSceneWidget extends StatefulWidget {
  const LoadingSceneWidget({Key? key}) : super(key: key);

  @override
  _LoadingSceneWidgetState createState() => _LoadingSceneWidgetState();
}

class _LoadingSceneWidgetState extends State<LoadingSceneWidget> {
  late LoadingSceneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingSceneModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
        ],
      ),
    );
  }
}
