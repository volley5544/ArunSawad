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
            alignment: AlignmentDirectional(0, 0),
            child: Image.asset(
              'assets/images/Spin-1s-200px_(1).gif',
              width: 120,
              height: 120,
              fit: BoxFit.scaleDown,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Image.asset(
              'assets/images/Load-54x54-02.gif',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
