// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';

class ShowDateTimeDash extends StatefulWidget {
  const ShowDateTimeDash({
    Key? key,
    this.width,
    this.height,
    this.currentTime,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime? currentTime;

  @override
  _ShowDateTimeDashState createState() => _ShowDateTimeDashState();
}

class _ShowDateTimeDashState extends State<ShowDateTimeDash> {
  @override
  Widget build(BuildContext context) {
    double dateTimeText = (widget.height! * 35) / 100;
    return Scaffold(
      body: Center(
        child: Container(
            height: widget.height,
            width: widget.width,
            color: Color(0xFF261E1E),
            child: Text(
              DateFormat('EEEE, \ndd MMMM y', 'th').format(widget.currentTime!),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: dateTimeText,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
