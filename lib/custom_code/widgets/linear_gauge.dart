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

import 'package:syncfusion_flutter_gauges/gauges.dart';

class LinearGauge extends StatefulWidget {
  const LinearGauge({
    Key? key,
    this.width,
    this.height,
    this.maxValue,
    this.value,
    this.interval,
    this.trackThickness,
    this.rangeColor,
    this.gaugeAnimationMillisec,
    this.markerAnimationMillisec,
    this.widgetPointerWidth,
    this.widgetPointerHeight,
    this.widgetPointerColor,
    this.widgetPointerShadowColor,
    this.widgetPointerTextColor,
    this.widgetPointerText,
    this.isHorizontal,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? maxValue;
  final double? value;
  final double? interval;
  final double? trackThickness;
  final Color? rangeColor;
  final int? gaugeAnimationMillisec;
  final int? markerAnimationMillisec;
  final double? widgetPointerWidth;
  final double? widgetPointerHeight;
  final Color? widgetPointerColor;
  final Color? widgetPointerShadowColor;
  final Color? widgetPointerTextColor;
  final String? widgetPointerText;
  final bool? isHorizontal;

  @override
  _LinearGaugeState createState() => _LinearGaugeState();
}

class _LinearGaugeState extends State<LinearGauge> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfLinearGauge(
            animateAxis: true,
            orientation: //widget.isHorizontal!
                //? LinearGaugeOrientation.horizontal
                //: LinearGaugeOrientation
                //.vertical, //LinearGaugeOrientation.vertical
                LinearGaugeOrientation.horizontal,
            animateRange: true,
            animationDuration: widget.gaugeAnimationMillisec!,
            interval: widget.interval!,
            maximum: widget.maxValue!,
            axisTrackStyle:
                LinearAxisTrackStyle(thickness: widget.trackThickness!),
            //orientation: _isHorizontalOrientation
            //? LinearGaugeOrientation.horizontal
            //: LinearGaugeOrientation.vertical,
            ranges: [
          LinearGaugeRange(
            color: widget.rangeColor!,
          )
        ],
            markerPointers: <LinearMarkerPointer>[
          LinearWidgetPointer(
            value: widget.value!,
            animationDuration: widget.markerAnimationMillisec!,
            animationType: LinearAnimationType.ease,
            child: Container(
                width: widget.widgetPointerWidth!,
                height: widget.widgetPointerHeight!,
                decoration: BoxDecoration(
                    color: widget.widgetPointerColor!,
                    //const Color(0xFFFFFFFF)
                    //const Color(0xff06589C),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: widget.widgetPointerShadowColor!,
                        //Colors.lightBlue,
                        //: Colors.black54,
                        offset: const Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    shape: BoxShape.circle),
                child: Center(
                    child: Text('${widget.widgetPointerText!}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.widgetPointerTextColor!,
                          //const Color(0xFFFFFFFF)
                          //const Color(0xffF45656),
                        )))),
          )
        ]));
  }

  /// Returns the gauge temperature monitor
}
