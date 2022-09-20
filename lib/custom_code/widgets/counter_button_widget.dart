// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:counter_button/counter_button.dart';

class CounterButtonWidget extends StatefulWidget {
  const CounterButtonWidget({
    Key? key,
    this.width,
    this.height,
    this.matetialRecordId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? matetialRecordId;

  @override
  _CounterButtonWidgetState createState() => _CounterButtonWidgetState();
}

class _CounterButtonWidgetState extends State<CounterButtonWidget> {
  int _counterValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CounterButton(
        loading: false,
        onChange: (int val) {
          setState(() {
            _counterValue = val;
          });
        },
        count: _counterValue,
        countColor: Colors.purple,
        buttonColor: Colors.purpleAccent,
        progressColor: Colors.purpleAccent,
      ),
    );
  }
}
