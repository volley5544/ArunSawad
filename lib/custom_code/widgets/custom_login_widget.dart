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
import 'package:google_fonts/google_fonts.dart';

class CustomLoginWidget extends StatefulWidget {
  const CustomLoginWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomLoginWidgetState createState() => _CustomLoginWidgetState();
}

class _CustomLoginWidgetState extends State<CustomLoginWidget> {
  double getSmallDiameter(BuildContext context) => widget.width! * 2 / 3;
  double getBiglDiameter(BuildContext context) => widget.width! * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFd63c00), Color(0xFFffa06c)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getBiglDiameter(context) / 4,
            top: -getBiglDiameter(context) / 4,
            child: Container(
              child: Center(
                child: Column(children: <Widget>[
                  Image.asset(
                    'assets/images/images.png',
                    scale: 1.5,
                  ),
                  const Text(
                    "Branch View",
                    style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ]),
              ),
              padding: const EdgeInsets.only(
                left: 70,
                top: 120,
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFd63c00), Color(0xFFffa06c)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
        ],
      ),
    );
  }
}
