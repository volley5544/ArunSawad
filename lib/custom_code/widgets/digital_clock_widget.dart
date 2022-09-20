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

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DigitalClockWidgetState createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {
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
              digitAnimationStyle: Curves.elasticOut,
              is24HourTimeFormat: true,
              areaDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
              hourMinuteDigitTextStyle: TextStyle(
                color: Colors.black,
                fontSize: clockTextSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
