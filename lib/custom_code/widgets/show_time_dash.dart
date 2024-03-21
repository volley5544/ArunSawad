// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:slide_digital_clock/slide_digital_clock.dart';

class ShowTimeDash extends StatefulWidget {
  const ShowTimeDash({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ShowTimeDashState createState() => _ShowTimeDashState();
}

class _ShowTimeDashState extends State<ShowTimeDash> {
  @override
  Widget build(BuildContext context) {
    double clockTextSize = (widget.height! * 60) / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: widget.height,
          color: Color(0xFF261E1E),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DigitalClock(
                digitAnimationStyle: Curves.elasticOut,
                is24HourTimeFormat: true,
                areaDecoration: BoxDecoration(
                    color: Color(0xFF261E1E),
                    border: Border.all(
                      color: Color(0xFF261E1E),
                    )),
                hourMinuteDigitTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: clockTextSize,
                ),
                hourDigitDecoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                minuteDigitDecoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                colon: Text(':',
                    style: TextStyle(
                      fontSize: clockTextSize * 0.7,
                      color: Colors.white,
                    )),
                secondDigitTextStyle: TextStyle(
                  fontSize: clockTextSize * 0.55,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
