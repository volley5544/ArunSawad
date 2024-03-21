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

class RadialGauge extends StatefulWidget {
  const RadialGauge({
    Key? key,
    this.width,
    this.height,
    this.maxValue,
    this.value,
    this.labelOffset,
    this.axisLabelSize,
    this.totalValueLabelSize,
    this.valueUnitLabelSize,
    this.valueUnitLabelText,
    this.totalValueUnitLabelText,
    this.endValue1,
    this.startValue2,
    this.endValue2,
    this.startValue3,
    this.color1,
    this.color2,
    this.color3,
    this.startWidth1,
    this.endWidth1,
    this.startWidth2,
    this.endWidth2,
    this.startWidth3,
    this.endWidth3,
    this.isShowTick,
    this.startWidth4,
    this.endWidth4,
    this.startWidth5,
    this.endWidth5,
    this.color4,
    this.color5,
    this.startValue4,
    this.endValue4,
    this.startValue5,
    this.endValue5,
    this.endValue3,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? maxValue;
  final String? value;
  final double? labelOffset;
  final double? axisLabelSize;
  final double? totalValueLabelSize;
  final double? valueUnitLabelSize;
  final String? valueUnitLabelText;
  final String? totalValueUnitLabelText;
  final double? endValue1;
  final double? startValue2;
  final double? endValue2;
  final double? startValue3;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final double? startWidth1;
  final double? endWidth1;
  final double? startWidth2;
  final double? endWidth2;
  final double? startWidth3;
  final double? endWidth3;
  final bool? isShowTick;
  final double? startWidth4;
  final double? endWidth4;
  final double? startWidth5;
  final double? endWidth5;
  final Color? color4;
  final Color? color5;
  final double? startValue4;
  final double? endValue4;
  final double? startValue5;
  final double? endValue5;
  final double? endValue3;

  @override
  _RadialGaugeState createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildTemperatureMonitorExample(),
    );
  }

  /// Returns the gauge temperature monitor
  SfRadialGauge _buildTemperatureMonitorExample() {
    String actual = widget.value!;
    String result3 = actual.replaceAll(RegExp('[^A-Za-z0-9.]'), '');
    print(result3);

    String targetBudget = widget.maxValue!;
    String result4 = targetBudget.replaceAll(RegExp('[^A-Za-z0-9.]'), '');
    print(result4);

    double trueActual = double.parse('$result3');
    double trueTargetBudget = double.parse('$result4');

    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';

    String result = '${trueActual.round()}'.replaceAllMapped(reg, mathFunc);
    //print('$trueValue -> $result');
    //final double value = 1000;
    return SfRadialGauge(
      animationDuration: 3500,
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            showTicks: widget.isShowTick!,
            minimum: 0,
            maximum: trueTargetBudget,
            interval: trueTargetBudget * 0.1,
            minorTicksPerInterval: 9,
            showAxisLine: false,
            radiusFactor: 1,
            labelOffset: widget.labelOffset!,
            canScaleToFit: false,
            showLastLabel: true,
            ranges: <GaugeRange>[
              // GaugeRange(
              //     startValue: -50,
              //     endValue: 0,
              //     startWidth: 0.265,
              //     sizeUnit: GaugeSizeUnit.factor,
              //     endWidth: 0.265,
              //     color: const Color.fromRGBO(34, 144, 199, 0.75)),
              // GaugeRange(
              //     startValue: 0,
              //     endValue: 10,
              //     startWidth: 0.265,
              //     sizeUnit: GaugeSizeUnit.factor,
              //     endWidth: 0.265,
              //     color: const Color.fromRGBO(34, 195, 199, 0.75)),
              GaugeRange(
                  startValue: 0,
                  endValue: trueTargetBudget * widget.endValue1!,
                  startWidth: widget.startWidth1!,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: widget.endWidth1!,
                  color: Color.fromRGBO(widget.color1!.red,
                      widget.color1!.green, widget.color1!.blue, 0.65)),
              GaugeRange(
                  startValue: trueTargetBudget * widget.startValue2!,
                  endValue: trueTargetBudget * widget.endValue2!,
                  startWidth: widget.startWidth2!,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: widget.endWidth2!,
                  color: Color.fromRGBO(widget.color2!.red,
                      widget.color2!.green, widget.color2!.blue, 0.75)),
              GaugeRange(
                  startValue: trueTargetBudget * widget.startValue3!,
                  endValue: trueTargetBudget * widget.endValue3!,
                  startWidth: widget.startWidth3!,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: widget.endWidth3!,
                  color: Color.fromRGBO(widget.color3!.red,
                      widget.color3!.green, widget.color3!.blue, 0.75)),

              GaugeRange(
                  startValue: trueTargetBudget * widget.startValue4!,
                  endValue: trueTargetBudget * widget.endValue4!,
                  startWidth: widget.startWidth4!,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: widget.endWidth4!,
                  color: Color.fromRGBO(widget.color4!.red,
                      widget.color4!.green, widget.color4!.blue, 0.75)),
              GaugeRange(
                  startValue: trueTargetBudget * widget.startValue5!,
                  endValue: trueTargetBudget,
                  startWidth: widget.startWidth5!,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: widget.endWidth5!,
                  color: Color.fromRGBO(widget.color5!.red,
                      widget.color5!.green, widget.color5!.blue, 0.75)),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.35,
                  widget: Text('${widget.valueUnitLabelText!}',
                      style: TextStyle(
                          color: Color(0xFFF8B195),
                          fontSize: widget.valueUnitLabelSize))),
              GaugeAnnotation(
                angle: 90,
                positionFactor: 0.8,
                widget: Text(
                  '$result ${widget.totalValueUnitLabelText!}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.totalValueLabelSize!),
                ),
              )
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: trueActual,
                needleStartWidth: 1,
                needleEndWidth: 8,
                animationType: AnimationType.easeOutBack,
                enableAnimation: true,
                animationDuration: 1200,
                knobStyle: KnobStyle(
                    knobRadius: 0.08,
                    borderColor: const Color(0xFFF8B195),
                    color: Colors.white,
                    borderWidth: 0.05),
                tailStyle: TailStyle(
                    color: const Color(0xFFF8B195), width: 8, length: 0.2),
                needleColor: const Color(0xFFF8B195),
              )
            ],
            axisLabelStyle: GaugeTextStyle(fontSize: widget.axisLabelSize!),
            majorTickStyle: const MajorTickStyle(
                length: 0.25, lengthUnit: GaugeSizeUnit.factor),
            minorTickStyle: const MinorTickStyle(
                length: 0.13, lengthUnit: GaugeSizeUnit.factor, thickness: 2))
      ],
    );
  }
}
