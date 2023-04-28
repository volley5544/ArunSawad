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

class ShowDateTime extends StatefulWidget {
  const ShowDateTime({
    Key? key,
    this.width,
    this.height,
    this.currentTime,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime? currentTime;

  @override
  _ShowDateTimeState createState() => _ShowDateTimeState();
}

class _ShowDateTimeState extends State<ShowDateTime> {
  @override
  Widget build(BuildContext context) {
    double dateTimeTextSize = (widget.height! * 70) / 100;
    return Scaffold(
      body: Center(
          child: Text(
        DateFormat('EEEE, dd MMMM y', 'th').format(widget.currentTime!),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: dateTimeTextSize,
          color: Colors.black,
        ),
      )),
    );
  }
}
