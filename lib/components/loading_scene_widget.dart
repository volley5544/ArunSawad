import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingSceneWidget extends StatefulWidget {
  const LoadingSceneWidget({Key? key}) : super(key: key);

  @override
  _LoadingSceneWidgetState createState() => _LoadingSceneWidgetState();
}

class _LoadingSceneWidgetState extends State<LoadingSceneWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x80000000),
      ),
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Image.asset(
          'assets/images/Spin-1s-200px_(1).gif',
          width: 100,
          height: 100,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
