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

import 'package:analog_clock/analog_clock.dart';

class ShowTimeOldType extends StatefulWidget {
  const ShowTimeOldType({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ShowTimeOldTypeState createState() => _ShowTimeOldTypeState();
}

class _ShowTimeOldTypeState extends State<ShowTimeOldType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnalogClock(
        //width: widget.width!,
        height: widget.height!,
        textScaleFactor: 2,
        showNumbers: false,
        digitalClockColor: Colors.blue,
      ),
    );
  }
}
