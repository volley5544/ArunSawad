// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:slide_digital_clock/slide_digital_clock.dart';

class DigitalClockWidgetDash extends StatefulWidget {
  const DigitalClockWidgetDash({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DigitalClockWidgetDashState createState() => _DigitalClockWidgetDashState();
}

class _DigitalClockWidgetDashState extends State<DigitalClockWidgetDash> {
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
