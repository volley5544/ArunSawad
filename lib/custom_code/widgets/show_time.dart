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

import 'package:slide_digital_clock/slide_digital_clock.dart';

class ShowTime extends StatefulWidget {
  const ShowTime({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  @override
  Widget build(BuildContext context) {
    double clockTextSize;
    clockTextSize = (widget.height! * 70) / 100;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DigitalClock(
              //digitAnimationStyle: Curves.elasticOut,
              is24HourTimeFormat: true,
              areaDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
              hourMinuteDigitTextStyle: TextStyle(
                color: Colors.black,
                fontSize: clockTextSize,
              ),
              hourDigitDecoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              minuteDigitDecoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              colon: Text(':',
                  style: TextStyle(
                    fontSize: clockTextSize * 0.7,
                    color: Colors.grey,
                  )),
              secondDigitTextStyle: TextStyle(
                fontSize: clockTextSize * 0.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
