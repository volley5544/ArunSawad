import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_seized_select_dashboard_widget.dart'
    show CarSeizedSelectDashboardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CarSeizedSelectDashboardModel
    extends FlutterFlowModel<CarSeizedSelectDashboardWidget> {
  ///  Local state fields for this page.

  dynamic readAccessRoleData;

  dynamic writeAccessRoleData;

  String userRoleRead = 'no_role';

  String userRoleSave = 'no_role';

  List<String> carConfig = [];
  void addToCarConfig(String item) => carConfig.add(item);
  void removeFromCarConfig(String item) => carConfig.remove(item);
  void removeAtIndexFromCarConfig(int index) => carConfig.removeAt(index);
  void insertAtIndexInCarConfig(int index, String item) =>
      carConfig.insert(index, item);
  void updateCarConfigAtIndex(int index, Function(String) updateFn) =>
      carConfig[index] = updateFn(carConfig[index]);

  List<String> motocycleConfig = [];
  void addToMotocycleConfig(String item) => motocycleConfig.add(item);
  void removeFromMotocycleConfig(String item) => motocycleConfig.remove(item);
  void removeAtIndexFromMotocycleConfig(int index) =>
      motocycleConfig.removeAt(index);
  void insertAtIndexInMotocycleConfig(int index, String item) =>
      motocycleConfig.insert(index, item);
  void updateMotocycleConfigAtIndex(int index, Function(String) updateFn) =>
      motocycleConfig[index] = updateFn(motocycleConfig[index]);

  dynamic editAccessRoleData;

  String userRoleEdit = 'no_role';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CarSeizedSelectDashboard widget.
  UrlLinkStorageRecord? urlLinkStorage;
  // Stores action output result for [Firestore Query - Query a collection] action in CarSeizedSelectDashboard widget.
  UrlLinkStorageRecord? urlLinkStorageVloan;
  // Stores action output result for [Custom Action - getDataFromCollection] action in CarSeizedSelectDashboard widget.
  dynamic? getDataCollection;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
