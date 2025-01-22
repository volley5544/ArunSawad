import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'tracking_emp_page_widget.dart' show TrackingEmpPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TrackingEmpPageModel extends FlutterFlowModel<TrackingEmpPageWidget> {
  ///  Local state fields for this page.

  String? dataDateSelected;

  List<TrackingEmployeeDateModelStruct> locationDateData = [];
  void addToLocationDateData(TrackingEmployeeDateModelStruct item) =>
      locationDateData.add(item);
  void removeFromLocationDateData(TrackingEmployeeDateModelStruct item) =>
      locationDateData.remove(item);
  void removeAtIndexFromLocationDateData(int index) =>
      locationDateData.removeAt(index);
  void insertAtIndexInLocationDateData(
          int index, TrackingEmployeeDateModelStruct item) =>
      locationDateData.insert(index, item);
  void updateLocationDateDataAtIndex(
          int index, Function(TrackingEmployeeDateModelStruct) updateFn) =>
      locationDateData[index] = updateFn(locationDateData[index]);

  List<TrackingEmployeeLocationModelStruct> locationByDateData = [];
  void addToLocationByDateData(TrackingEmployeeLocationModelStruct item) =>
      locationByDateData.add(item);
  void removeFromLocationByDateData(TrackingEmployeeLocationModelStruct item) =>
      locationByDateData.remove(item);
  void removeAtIndexFromLocationByDateData(int index) =>
      locationByDateData.removeAt(index);
  void insertAtIndexInLocationByDateData(
          int index, TrackingEmployeeLocationModelStruct item) =>
      locationByDateData.insert(index, item);
  void updateLocationByDateDataAtIndex(
          int index, Function(TrackingEmployeeLocationModelStruct) updateFn) =>
      locationByDateData[index] = updateFn(locationByDateData[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
