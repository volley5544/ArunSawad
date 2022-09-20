// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter/services.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 40,
          child: Container(
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                splashColor: Colors.amber,
                onTap: () {},
                child: const Center(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    colors: [Color(0xFFd63c00), Color(0xFFffa071)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
      ]),
    );
  }
}
